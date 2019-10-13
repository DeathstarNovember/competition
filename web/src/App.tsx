import React from "react";
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "@apollo/react-hooks";
import { ThemeProvider } from "styled-components";
import { theme } from "./ui";
import UserList from "./components/UserList";
import "./App.css";
import Contest from "./components/Contest";
import { Box } from "./ui";

const App: React.FC = () => {
  const client = new ApolloClient({
    uri: "http://localhost:4000"
  });
  return (
    <ApolloProvider client={client}>
      <ThemeProvider theme={theme}>
        <Box alignItems="center" flexDirection="column">
          <h1>Competition</h1>
          <Contest />
        </Box>
      </ThemeProvider>
    </ApolloProvider>
  );
};

export default App;
