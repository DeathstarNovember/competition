import React from "react";
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "@apollo/react-hooks";
import "./App.css";

const App: React.FC = () => {
  const client = new ApolloClient();
  return (
    <ApolloProvider client={client}>
      <h1>Competition</h1>
    </ApolloProvider>
  );
};

export default App;
