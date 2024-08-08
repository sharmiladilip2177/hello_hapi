# use the latest node LTS release
FROM node:gallium
WORKDIR /usr/src/app

# copy package.json and package-lock.json and install packages. we do this
# separate from the application code to better use docker's caching
# `npm install` will be cached on future builds if only the app code changed
COPY package*.json ./
RUN npm install
RUN curl "https://d1uj6qtbmh3dt5.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    aws --version

# copy the app
COPY . .

# expose port 3000 and start the app
EXPOSE 3000
CMD [ "npm", "start" ]

