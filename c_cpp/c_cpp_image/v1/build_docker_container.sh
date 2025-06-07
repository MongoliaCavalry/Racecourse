#!/bin/bash
# This script builds a Docker container for the Fast Flutter UI application.

docker run -d -p 8088:80 -p 8089:8000 --name my_fast_pipeline_app fast_pipeline_app