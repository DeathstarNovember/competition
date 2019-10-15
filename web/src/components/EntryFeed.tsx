import React from "react";
import gql from "graphql-tag";
import { useQuery } from "@apollo/react-hooks";
import { formatTimeMS } from "../util";
import { User, Entry } from "../types";
import EntryPreview from "./EntryPreview";

const LIST_ENTRIES = gql`
  {
    listEntries {
      id
      user {
        id
        firstName
        lastName
      }
      distance
      time
      strokeRate
      completedAt
    }
  }
`;
type EntryFeedProps = {
  currentUser?: User;
};
const EntryFeed: React.FC<EntryFeedProps> = ({ currentUser }) => {
  const { loading, error, data } = useQuery(LIST_ENTRIES);
  if (loading) {
    return <div className="p-6 rounded-lg shadow-xl">Loading....</div>;
  }

  if (error) {
    return (
      <div className="p-6 bg-red-200  rounded-lg shadow-xl text-red-900">
        Error: {JSON.stringify(error)}
      </div>
    );
  }
  if (!data.listEntries.length) {
    return (
      <div className={"max-w-md mx-auto p-6"}>
        <div className="w-full max-w-md">
          <div className="p-6 bg-white rounded-lg shadow-xl ">
            No entries yet...
          </div>
        </div>
      </div>
    );
  }
  return (
    <div className={"max-w-md mx-auto p-6"}>
      <div className="w-full max-w-md">
        <div className="p-6 bg-white rounded-lg shadow-xl">
          {data.listEntries.map((entry: Entry, entryId: number) => (
            <EntryPreview
              key={`${entry.user.id}${entryId}`}
              entry={entry}
              entryId={entryId}
            />
          ))}
        </div>
      </div>
    </div>
  );
};

export default EntryFeed;
