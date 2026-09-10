"""
DermaAgent - Live Health & Latency Monitor Script
"""

import sys
import time
import json
import urllib.request
from datetime import datetime

# Ensure UTF-8 console output on Windows
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')

LIVE_URL = "https://ca-dermaagent-dev.ashyground-d796bf8e.eastus.azurecontainerapps.io"
HEALTH_ENDPOINT = f"{LIVE_URL}/api/health"

def check_health():
    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Checking DermaAgent Live Endpoint: {HEALTH_ENDPOINT}")
    start_time = time.time()
    try:
        req = urllib.request.Request(HEALTH_ENDPOINT, headers={'User-Agent': 'DermaAgent-Monitor/1.0'})
        with urllib.request.urlopen(req, timeout=10) as response:
            latency_ms = round((time.time() - start_time) * 1000, 2)
            status_code = response.getcode()
            body = response.read().decode('utf-8')
            
            if status_code == 200:
                data = json.loads(body)
                print("[SUCCESS] Status: HEALTHY (HTTP 200)")
                print(f"[METRIC] Response Latency: {latency_ms} ms")
                print(f"[PAYLOAD] {json.dumps(data, indent=2)}")
                return True
            else:
                print(f"[FAILURE] Status: UNHEALTHY (HTTP {status_code})")
                return False
    except Exception as e:
        print(f"[ERROR] Health Check Failed: {e}")
        return False

if __name__ == "__main__":
    check_health()
