import React, { useState } from "react";
import gql from "graphql-tag";
import { useQuery } from "@apollo/react-hooks";
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
  enum DisplayOptions {
    Public,
    Personal,
  }
  const [displayOption, setDisplayOption] = useState(DisplayOptions.Public);
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

  const publicEntries: Entry[] = data.listEntries;
  const myEntries: Entry[] = currentUser
    ? data.listEntries.filter((e: Entry) => e.user.id === currentUser.id)
    : undefined;
  const entryList =
    displayOption === DisplayOptions.Personal ? myEntries : publicEntries;
  const changeDisplayOption = (option: DisplayOptions) => {
    setDisplayOption(option);
  };
  return (
    <div className={"max-w-md mx-auto p-6"}>
      <div className="w-full max-w-md">
        {displayOption !== DisplayOptions.Personal ? (
          <button
            className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 mb-4 rounded focus:outline-none focus:shadow-outline"
            type="button"
            onClick={() => changeDisplayOption(DisplayOptions.Personal)}
          >
            See Personal Feed
          </button>
        ) : null}
        {displayOption !== DisplayOptions.Public && currentUser ? (
          <button
            className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 mb-4 rounded focus:outline-none focus:shadow-outline"
            type="button"
            onClick={() => changeDisplayOption(DisplayOptions.Public)}
          >
            See Public Feed
          </button>
        ) : null}
        <div className="p-6 bg-white rounded-lg shadow-xl">
          {entryList.map((entry: Entry, entryId: number) => (
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
