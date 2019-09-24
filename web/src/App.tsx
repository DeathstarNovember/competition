import React from "react";
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "@apollo/react-hooks";
import UserList from "./UserList";
import "./App.css";

const App: React.FC = () => {
  const client = new ApolloClient({
    uri: "http://localhost:4000"
  });
  return (
    <ApolloProvider client={client}>
      <h1>Competition</h1>
      <UserList />
    </ApolloProvider>
  );
};

export default App;
