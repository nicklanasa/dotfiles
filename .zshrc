export PATH=/opt/homebrew/opt/curl/bin:$PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/nick/.lmstudio/bin"
# End of LM Studio CLI section

alias glm="cd ~/Developer/ds4 && ./ds4-server -m gguf/GLM-5.3-Flash-Q2.gguf --ctx 256000 --vision gguf/GLM-5.3-Flash-Vision-Encoder.gguf"

# DwarfStar model servers (run one at a time on localhost:8000).
# All DwarfStar presets use at least 256000 context tokens; runtime memory fit must be checked.
alias glm-stream="cd ~/Developer/ds4 && ./ds4-server -m gguf/GLM-5.3-Flash-Q4_K.gguf --ssd-streaming --ctx 256000 --vision gguf/GLM-5.3-Flash-Vision-Encoder.gguf"
alias deepseek="cd ~/Developer/ds4 && ./ds4-server -m gguf/DeepSeek-V4-Flash-Layers37-42Q4KExperts-OtherExpertLayersIQ2XXSGateUp-Q2KDown-AProjQ8-SExpQ8-OutQ8-chat-v2-imatrix-fixed-0731.gguf --ctx 256000"
alias qwen="cd ~/Developer/ds4 && ./ds4-server -m gguf/Qwen3.8-Flash-Next-Q4.gguf --ctx 256000 --vision gguf/mmproj-Qwen3.8-Flash-Next-Q8_0.gguf"

# DeepSeek Flash Q4: larger quantization using SSD expert streaming.
alias deepseek-stream="cd ~/Developer/ds4 && ./ds4-server -m gguf/DeepSeek-V4-Flash-Q4KExperts-F16HC-F16Compressor-F16Indexer-Q8Attn-Q8Shared-Q8Out-chat-v2-imatrix-0731.gguf --ssd-streaming --ctx 256000"

# DeepSeek V4.1 Flash: both quantizations require SSD streaming on 128GB.
alias deepseek41-q2="cd ~/Developer/ds4 && ./ds4-server -m gguf/DeepSeek-V4.1-Flash-Q2.gguf --ssd-streaming --ctx 256000"
alias deepseek41-q4="cd ~/Developer/ds4 && ./ds4-server -m gguf/DeepSeek-V4.1-Flash-Q4.gguf --ssd-streaming --ctx 256000"
