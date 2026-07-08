# SSH Failed Login Log Parser

A simple bash script that parses SSH authentication logs to detect potential brute-force login attempts.

## What it does

- Filters `Failed password` entries from an auth log
- Extracts the source IP from each failed attempt
- Counts failed attempts grouped by IP
- Flags any IP exceeding a configurable threshold as suspicious

## Usage

```bash
chmod +x log_parser.sh
./log_parser.sh
```

By default, the script reads from `practice_auth.log` with a threshold of 10 failed attempts. Both the log file path and threshold are configured as variables at the top of the script for easy adjustment.

## Example output

185.220.101.45: 8 attempts - OK
192.168.1.50: 2 attempts - OK
203.0.113.77: 2 attempts - OK
45.155.204.10: 3 attempts - OK

If an IP exceeds the threshold, it's flagged:

⚠ WARNING: 185.220.101.45 (12 failed attempts)

## Tools used

`grep`, `awk`, `sort`, `uniq`, bash conditionals and loops.
EOF
