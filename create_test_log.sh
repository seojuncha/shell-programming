#!/bin/bash

# Create a log file with various patterns
cat << 'EOF' > samples/test.log
[2024-01-01 00:01:23] INFO: System startup initiated
[2024-01-01 00:01:24] DEBUG: Loading configuration from /etc/app/config.yaml
[2024-01-01 00:01:25] WARNING: Deprecated setting 'old_parameter' detected
[2024-01-01 00:01:26] ERROR: Failed to connect to database - retrying in 5s
[2024-01-01 00:01:31] INFO: Database connection established
[2024-01-01 00:02:00] DEBUG: User john.doe@example.com logged in
[2024-01-01 00:02:05] INFO: Processing batch job #12345
[2024-01-01 00:02:06] ERROR: Invalid data format in row 123: missing required field
[2024-01-01 00:02:07] WARNING: Memory usage above 80% threshold
[2024-01-01 00:02:10] INFO: Backup process started
[2024-01-01 00:02:15] DEBUG: Scanning directory /var/data/
[2024-01-01 00:02:20] INFO: Found 1500 files to backup
[2024-01-01 00:02:25] ERROR: Permission denied: /var/data/restricted/
2024-01-01 00:02:30 Status: 404 Not Found - /api/v1/users
2024-01-01 00:02:35 Status: 200 OK - /api/v1/products
2024-01-01 00:02:40 Status: 500 Internal Server Error - /api/v1/orders
# Configuration section
HOST=localhost
PORT=8080
DEBUG_MODE=true
MAX_CONNECTIONS=100
# End configuration
[2024-01-01 00:03:00] INFO: Daily maintenance complete
[2024-01-01 00:03:05] DEBUG: Cache hit ratio: 87.5%
[2024-01-01 00:03:10] INFO: Processing user data for ID: 12345
[2024-01-01 00:03:15] WARNING: API rate limit approaching: 95%
[2024-01-01 00:03:20] ERROR: Stack trace:
   at Function.Module._load (module.js:271:25)
   at Module.require (module.js:355:17)
   at require (internal/module.js:92:18)
127.0.0.1 - - [01/Jan/2024:00:04:00 +0000] "GET /index.html HTTP/1.1" 200 2326
127.0.0.1 - - [01/Jan/2024:00:04:05 +0000] "POST /api/login HTTP/1.1" 401 1842
192.168.1.100 - - [01/Jan/2024:00:04:10 +0000] "GET /images/logo.png HTTP/1.1" 304 0
EOF
