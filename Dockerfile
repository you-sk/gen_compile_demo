FROM registry.gitlab.com/doragasu/docker-sgdk:v2.11

# Reset entrypoint to allow normal shell commands
ENTRYPOINT []

# 作業ディレクトリの設定
WORKDIR /m68k

# コンテナ起動時のコマンド
CMD ["/bin/bash"]