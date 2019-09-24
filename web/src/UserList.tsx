import React from "react";
import gql from "graphql-tag";
import { useQuery } from "@apollo/react-hooks";

const LIST_USERS = gql`
  {
    list_users {
      id
      firstName
      lastName
      email
      warCry
    }
  }
`;

const UserList = () => {
  const { loading, error, data } = useQuery(LIST_USERS);
  if (loading) {
    return <div>Loading....</div>;
  }
  if (error) {
    return <div>Error: {JSON.stringify(error)}</div>;
  }
  return (
    <div>
      {data.list_users.map((user: any, userId: number) => (
        <div key={userId}>{user.firstName}</div>
      ))}
    </div>
  );
};

export default UserList;
