import React from "react";
import gql from "graphql-tag";
import { useQuery } from "@apollo/react-hooks";
import { Comp, ContestEntry, Competitor } from "../reducer/initialState";
import { RouteComponentProps, navigate } from "@reach/router";

import CreateEntry from "./CreateEntry";
import CompetitionList from "./CompetitionList";

type Props = {
  currentUser: Competitor;
  comps: Comp[];
  entries: ContestEntry[];
};

const Dashboard: React.FC<RouteComponentProps<Props>> = ({
  currentUser,
  comps,
  entries,
}) => {
  return (
    <div className={"p-6"}>
      <CreateEntry currentUser={currentUser} />
      <CompetitionList path="/" comps={comps} entries={entries} />
    </div>
  );
};

export default Dashboard;
