import React from "react";
import { formatTimeMS } from "../util";
import { Entry } from "../types";
import { format } from "date-fns/esm";
type EntryProps = {
  entry: Entry;
  entryId: number;
};
const EntryPreview: React.FC<EntryProps> = ({ entry, entryId }) => {
  return (
    <div
      key={entryId}
      className="p-2 border-b last:border-b-0 border-color-gray-700
          hover:bg-gray-200"
    >
      <div>{`${entry.user.firstName} ${entry.user.lastName[0]}: ${format(
        new Date(entry.completedAt),
        "Pp"
      )}`}</div>
      <div>
        {`${entry.distance}m in ${formatTimeMS(entry.time)} (${(
          entry.distance / entry.time
        ).toFixed(2)}m/s) at ${entry.strokeRate}s/m`}
      </div>
    </div>
  );
};

export default EntryPreview;
