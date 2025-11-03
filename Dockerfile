FROM bitnami/node@sha256:31e6dbbda0ae47740352412d5f0ca11bacc26843366715d13274d32a9d2eb74c AS builder
ENV NODE_ENV="production"

# Copy app's source code to the /app directory
COPY . /app

# The application's directory will be the working directory
WORKDIR /app

# Install Node.js dependencies defined in '/app/packages.json'
RUN npm install

FROM bitnami/node@sha256:31e6dbbda0ae47740352412d5f0ca11bacc26843366715d13274d32a9d2eb74c
ENV NODE_ENV="production"
COPY --from=builder /app /app
WORKDIR /app
ENV PORT 5000
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
