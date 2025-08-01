import { api } from "encore.dev/api";

interface StatusResponse {
  status: string;
  timestamp: Date;
  version: string;
}

// Returns the current status of the backend service.
export const status = api<void, StatusResponse>(
  { expose: true, method: "GET", path: "/status" },
  async () => {
    return {
      status: "healthy",
      timestamp: new Date(),
      version: "1.0.0"
    };
  }
);
