
cd Docker
docker build -t phoenix .
docker run -d -p 4000:4000 phoenix mix phoenix.server
