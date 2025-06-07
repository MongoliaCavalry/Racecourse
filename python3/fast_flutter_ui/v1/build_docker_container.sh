#!/bin/bash
# This script builds a Docker container for the Fast Flutter UI application.

docker run -d -p 8080:8080 -p 8000:8000 --name my_fast_flutter_ui fast_flutter_ui