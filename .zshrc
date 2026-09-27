export PATH=/opt/homebrew/opt/curl/bin:$PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export OPENCODE_ENABLE_PARALLEL=1

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/nick/.lmstudio/bin"
# End of LM Studio CLI section

alias glm="cd ~/Developer/ds4 && ./ds4-server -m gguf/GLM-5.3-Flash-Q2.gguf --ctx 128000 --vision gguf/GLM-5.3-Flash-Vision-Encoder.gguf --mtp --kv-disk-dir ~/.ds4/glm-kv --kv-disk-space-mb 8192"

# DwarfStar model servers (run one at a time on localhost:8000).
# DwarfStar presets use 128000 context tokens; runtime memory fit must be checked.
# Each model has an 8 GiB disk KV cache for reusable text prefixes.
alias glm-stream="cd ~/Developer/ds4 && ./ds4-server -m gguf/GLM-5.3-Flash-Q4_K.gguf --ssd-streaming --ctx 128000 --vision gguf/GLM-5.3-Flash-Vision-Encoder.gguf --mtp --kv-disk-dir ~/.ds4/glm-stream-kv --kv-disk-space-mb 8192"
alias deepseek="cd ~/Developer/ds4 && ./ds4-server -m gguf/DeepSeek-V4-Flash-Layers37-42Q4KExperts-OtherExpertLayersIQ2XXSGateUp-Q2KDown-AProjQ8-SExpQ8-OutQ8-chat-v2-imatrix-fixed-0731.gguf --ctx 128000 --dspark --mtp-model gguf/DeepSeek-V4-Flash-DSpark-support-0731.gguf --kv-disk-dir ~/.ds4/deepseek-kv --kv-disk-space-mb 8192"
alias deepseek-vision="cd ~/Developer/ds4 && ./ds4-server -m gguf/DeepSeek-V4-Flash-Vision-Exp-Layers37-42Q4KExperts-OtherExpertLayersIQ2XXSGateUp-Q2KDown-AProjQ8-SExpQ8-OutQ8.gguf --ctx 128000 --vision gguf/DeepSeek-V4-Flash-Vision-Encoder.gguf --dspark --mtp-model gguf/DeepSeek-V4-Flash-Vision-Exp-DSpark-support.gguf --kv-disk-dir ~/.ds4/deepseek-vision-kv --kv-disk-space-mb 8192"
alias qwen="cd ~/Developer/ds4 && ./ds4-server -m gguf/Qwen3.8-Flash-Next-Q4.gguf --ctx 128000 --vision gguf/mmproj-Qwen3.8-Flash-Next-Q8_0.gguf --mtp --kv-disk-dir ~/.ds4/qwen-kv --kv-disk-space-mb 8192"

# DeepSeek V4.1 Flash Q2: downloaded streaming model.
alias deepseek-stream="cd ~/Developer/ds4 && ./ds4-server -m gguf/DeepSeek-V4.1-Flash-Q2.gguf --ssd-streaming --ctx 128000 --vision gguf/DeepSeek-V4.1-Flash-Vision.gguf --kv-disk-dir ~/.ds4/deepseek-stream-kv --kv-disk-space-mb 8192"

# Not downloaded yet: ./download_model.sh ds41f-q4
# alias deepseek41-q4="cd ~/Developer/ds4 && ./ds4-server -m gguf/DeepSeek-V4.1-Flash-Q4.gguf --ssd-streaming --ctx 128000 --kv-disk-dir ~/.ds4/deepseek41-q4-kv --kv-disk-space-mb 8192"
