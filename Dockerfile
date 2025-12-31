# Usa a imagem oficial como base (funciona em ARM/Oracle)
FROM rclone/rclone:latest

# Define que vamos rodar como ROOT para sempre (acaba com erro de permissão)
USER root

# Cria a pasta de dados
RUN mkdir -p /data

# Define a variável de ambiente para escrita segura
ENV RCLONE_VFS_CACHE_MODE=writes

# Expõe a porta 8080 (informa ao Docker que essa porta existe)
EXPOSE 8080

# O COMANDO BLINDADO:
# Aqui definimos exatamente o que roda quando o container sobe.
# Não depende de configuração visual do Coolify.
ENTRYPOINT ["rclone", "serve", "webdav", "/data", "--addr", ":8080", "--user", "alexander", "--pass", "senha123", "--vfs-cache-mode", "writes"]
