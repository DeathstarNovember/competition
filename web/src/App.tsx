import React, { useReducer, useEffect } from "react";
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "@apollo/react-hooks";
import { ThemeProvider } from "styled-components";
import { theme } from "./ui";
// import UserList from './components/UserList'
import Login from "./components/Login";
// import './App.css'
import CompetitionList from "./components/CompetitionList";
// import { Box } from './ui'
import { initialState, contestsReducer } from "./reducer";
import { Router, navigate } from "@reach/router";

import { useLocalStorage } from "./hooks";
import Dashboard from "./components/Dashboard";

const client = new ApolloClient({
  uri: "http://localhost:4000",
});

type AppBarProps = {
  currentUser: any;
  onSignOut: VoidFunction;
};

const AppBar: React.FC<AppBarProps> = ({ currentUser, onSignOut }) => {
  return (
    <div className="py-2 px-3 bg-gray-500 flex justify-between shadow-md text-gray-700">
      <div className="flex">
        {currentUser ? (
          <>
            <div className="text-gray-200 pr-2">Signed in as:</div>
            <div>
              {currentUser.firstName} {currentUser.lastName}
            </div>
          </>
        ) : (
          "Not signed in"
        )}
      </div>
      {currentUser ? (
        <div
          className="cursor-pointer uppercase font-semibold tracking-wide hover:text-gray-800"
          onClick={onSignOut}
        >
          Sign Out
        </div>
      ) : (
        <div />
      )}
    </div>
  );
};

const App: React.FC = () => {
  const [{ comps, entries }, dispatch] = useReducer(
    contestsReducer,
    initialState
  );

  const [currentUser, setCurrentUser] = useLocalStorage("CURRENT_USER", "");

  const handleSignOut = () => {
    setCurrentUser("");
  };

  console.warn("App", { currentUser });

  useEffect(() => {
    if (currentUser === "") {
      navigate("login");
    }
  }, [currentUser]);

  return (
    <ApolloProvider client={client}>
      <ThemeProvider theme={theme}>
        <div className="min-h-screen bg-gray-200">
          <AppBar currentUser={currentUser} onSignOut={handleSignOut} />

          <Router>
            <Login path="login" selectUser={setCurrentUser} />
            <Dashboard
              path="/"
              currentUser={currentUser}
              comps={comps}
              entries={entries}
            />
          </Router>
        </div>
      </ThemeProvider>
    </ApolloProvider>
  );
};

export default App;
