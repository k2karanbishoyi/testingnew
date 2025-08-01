import { api } from "encore.dev/api";

interface GreetRequest {
  name: string;
}

interface GreetResponse {
  message: string;
}

// Greets a user with a personalized message.
export const greet = api<GreetRequest, GreetResponse>(
  { expose: true, method: "POST", path: "/greet" },
  async (req) => {
    return {
      message: `Hello, ${req.name}! Welcome to your simple backend.`
    };
  }
);
