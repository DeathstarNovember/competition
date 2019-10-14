import { CompetitionState } from "./initialState";

export type ContestAction = {
  type: string;
  payload?: any;
};

const contestsReducer = (
  state: CompetitionState,
  { type, payload }: ContestAction
): CompetitionState => {
  switch (type) {
    default:
      return state;
  }
};

export default contestsReducer;
