import React, { useReducer } from "react";
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "@apollo/react-hooks";
import { ThemeProvider } from "styled-components";
import { theme } from "./ui";
import UserList from "./components/UserList";
import "./App.css";
import CompetitionList from "./components/CompetitionList";
import { Box } from "./ui";
import { initialState, contestsReducer } from "./reducer";

const App: React.FC = () => {
  const client = new ApolloClient({
    uri: "http://localhost:4000"
  });
  const [{ comps, entries }, dispatch] = useReducer(
    contestsReducer,
    initialState
  );
  return (
    <ApolloProvider client={client}>
      <ThemeProvider theme={theme}>
        <Box alignItems="center" flexDirection="column" width="100vw">
          <CompetitionList comps={comps} entries={entries} />
        </Box>
      </ThemeProvider>
    </ApolloProvider>
  );
};

export default App;
