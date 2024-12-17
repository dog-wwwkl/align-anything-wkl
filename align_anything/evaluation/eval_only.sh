#!/usr/bin/env bash
#
# Copyright 2024 PKU-Alignment Team. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================

while [[ $# -gt 0 ]]; do
  case "$1" in
    --benchmark)
      benchmark="$2"
      shift 2
      ;;
    --output_dir)
      output="$2"
      shift 2
      ;;
    --generation_output)
      generation_output="$2"
      shift 2
      ;;
    -g)
      generation_output="$2"
      shift 2
      ;;
    --uuid)
      uuid="$2"
      shift 2
      ;;
    --model_id)
      model_id="$2"
      shift 2
      ;;
    *)
      shift
      ;;
  esac
done

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
TARGET_DIR="${SCRIPT_DIR}/benchmarks/${benchmark}"
cd "$TARGET_DIR" || { echo "Failed to change directory to $TARGET_DIR"; exit 1; }

ARGS="--output_dir $output --generation_output $generation_output --uuid $uuid --model_id $model_id"

python eval_only.py $ARGS
