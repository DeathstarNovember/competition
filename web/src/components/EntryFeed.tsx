import React, { useState } from "react";
import { useQuery } from "@apollo/react-hooks";
import { User, Entry } from "../types";
import EntryPreview from "./EntryPreview";
import {
  getEntryGroupAvgPowerOutput,
  getEntryGroupTotalPowerProduced,
  getEntryGroupAvgPace,
} from "../util";
import { LIST_ENTRIES } from "../util";

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
  const groupEntries = () => {
    const groupedEntries: Entry[][] = [];
    entryList
      .map(e => e.user.id)
      .filter((v, i, a) => a.indexOf(v) === i)
      .forEach(userId =>
        groupedEntries.push(entryList.filter(e => e.user.id === userId))
      );
    return groupedEntries;
  };
  const groupedEntries = groupEntries();
  const changeDisplayOption = (option: DisplayOptions) => {
    setDisplayOption(option);
  };
  return (
    <div className={"max-w-md mx-auto p-6"}>
      <div className="w-full max-w-md">
        {displayOption !== DisplayOptions.Personal ? (
          <div>
            <button
              className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 mb-4 rounded focus:outline-none focus:shadow-outline"
              type="button"
              onClick={() => changeDisplayOption(DisplayOptions.Personal)}
            >
              See Personal Feed
            </button>
            <div className="p-6 bg-white rounded-lg shadow-xl">
              {groupedEntries.map((entryGroup, entryGroupId) => (
                <div key={`entryGroup${entryGroupId}`} className="mb-16">
                  <div className="ml-2 text-xl font-bold">
                    {entryGroup
                      .map(e => `${e.user.firstName} ${e.user.lastName[0]}.`)
                      .filter((v, i, a) => a.indexOf(v) === i)
                      .join(", ")}
                  </div>
                  <div className="flex justify-around pb-4 ml-2 bg-blue-700 rounded-lg p-2 text-white">
                    <div className="flex-column">
                      <div className="font-bold">Avg Spd</div>
                      <div className="font-bold">{`${getEntryGroupAvgPace(
                        entryGroup
                      )}m/s`}</div>
                    </div>
                    <div className="flex-column">
                      <div className="font-bold">Avg Pwr</div>
                      <div className="font-bold">{`${getEntryGroupAvgPowerOutput(
                        entryGroup
                      )}W`}</div>
                    </div>
                    <div className="flex-column">
                      <div className="font-bold">Total Pwr</div>
                      <div className="font-bold">{`${getEntryGroupTotalPowerProduced(
                        entryGroup
                      )}J`}</div>
                    </div>
                  </div>
                  {entryGroup.map((entry: Entry, entryId: number) => (
                    <EntryPreview
                      key={`${entry.user.id}${entryId}`}
                      entry={entry}
                      entryId={entryId}
                    />
                  ))}
                </div>
              ))}
            </div>
          </div>
        ) : null}
        {displayOption !== DisplayOptions.Public && currentUser ? (
          <div>
            <button
              className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 mb-4 rounded focus:outline-none focus:shadow-outline"
              type="button"
              onClick={() => changeDisplayOption(DisplayOptions.Public)}
            >
              See Public Feed
            </button>
            <div className="p-6 bg-white rounded-lg shadow-xl">
              {groupedEntries.map((entryGroup, entryGroupId) => (
                <div>
                  <div className="pb-4 ml-2">
                    <h3 className="font-bold ">Your Log</h3>
                    <div>{`avg power ${getEntryGroupAvgPowerOutput(
                      entryGroup
                    )}W`}</div>
                    <div>{`total power ${getEntryGroupTotalPowerProduced(
                      entryGroup
                    )}J`}</div>
                  </div>
                  {entryGroup.map((entry: Entry, entryId: number) => (
                    <EntryPreview
                      key={`${entry.user.id}${entryId}`}
                      entry={entry}
                      entryId={entryId}
                    />
                  ))}
                </div>
              ))}
            </div>
          </div>
        ) : null}
      </div>
    </div>
  );
};

export default EntryFeed;
