FROM node:20
#criando o nome da minha preferencia
WORKDIR /app

COPY package* .
run npm install
COPY . .

ENTRYPOINT [ "npm start" ]