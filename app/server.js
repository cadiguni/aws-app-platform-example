const express = require("express");

const app = express();

const PORT = Number(process.env.PORT || 8080);
const APP_NAME = process.env.APP_NAME || "aws-app-platform";
const APP_VERSION = process.env.APP_VERSION || "dev";

app.use((req, res, next) => {
  const startNs = process.hrtime.bigint();

  res.on("finish", () => {
    const endNs = process.hrtime.bigint();
    const latencyMs = Number(endNs - startNs) / 1_000_000;
    console.log(
      `${req.method} ${req.originalUrl} ${res.statusCode} ${latencyMs.toFixed(2)}ms`
    );
  });

  next();
});

app.get("/health", (_req, res) => {
  res.status(200).json({ status: "ok" });
});

app.get("/", (_req, res) => {
  res.status(200).json({
    app: APP_NAME,
    version: APP_VERSION
  });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(
    `Server started on port ${PORT} (app=${APP_NAME}, version=${APP_VERSION})`
  );
});
