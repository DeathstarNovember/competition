type Competitor = {
  id: number;
  firstName: string;
  lastName: string;
};

const competitors: Competitor[] = [
  { id: 0, firstName: "Felix", lastName: "Green" },
  { id: 1, firstName: "Matt", lastName: "Dean" },
  { id: 2, firstName: "John", lastName: "Hill" }
];

export type ContestEntry = {
  competitorId: number;
  date: Date;
  distance: number;
  time: number;
};

const contestEntries: ContestEntry[] = [
  {
    competitorId: 0,
    date: new Date("2019-10-01"),
    distance: 500,
    time: 135
  },
  {
    competitorId: 0,
    date: new Date("2019-10-02"),
    distance: 500,
    time: 130
  },
  {
    competitorId: 0,
    date: new Date("2019-10-03"),
    distance: 500,
    time: 145
  },
  {
    competitorId: 0,
    date: new Date("2019-10-05"),
    distance: 500,
    time: 125
  },
  {
    competitorId: 0,
    date: new Date("2019-10-06"),
    distance: 500,
    time: 122
  },
  {
    competitorId: 0,
    date: new Date("2019-10-09"),
    distance: 500,
    time: 120
  },
  {
    competitorId: 0,
    date: new Date("2019-10-10"),
    distance: 500,
    time: 119
  },
  {
    competitorId: 1,
    date: new Date("2019-10-01"),
    distance: 500,
    time: 140
  },
  {
    competitorId: 1,
    date: new Date("2019-10-02"),
    distance: 500,
    time: 138
  },
  {
    competitorId: 1,
    date: new Date("2019-10-03"),
    distance: 500,
    time: 130
  },
  {
    competitorId: 1,
    date: new Date("2019-10-05"),
    distance: 500,
    time: 125
  },
  {
    competitorId: 1,
    date: new Date("2019-10-06"),
    distance: 500,
    time: 118
  },
  {
    competitorId: 1,
    date: new Date("2019-10-09"),
    distance: 500,
    time: 115
  },
  {
    competitorId: 1,
    date: new Date("2019-10-10"),
    distance: 500,
    time: 117
  },
  {
    competitorId: 2,
    date: new Date("2019-10-01"),
    distance: 500,
    time: 121
  },
  {
    competitorId: 2,
    date: new Date("2019-10-02"),
    distance: 500,
    time: 119
  },
  {
    competitorId: 2,
    date: new Date("2019-10-03"),
    distance: 500,
    time: 115
  },
  {
    competitorId: 2,
    date: new Date("2019-10-05"),
    distance: 500,
    time: 117
  },
  {
    competitorId: 2,
    date: new Date("2019-10-06"),
    distance: 500,
    time: 114
  },
  {
    competitorId: 2,
    date: new Date("2019-10-08"),
    distance: 500,
    time: 113
  },
  {
    competitorId: 2,
    date: new Date("2019-10-09"),
    distance: 500,
    time: 114
  },
  {
    competitorId: 2,
    date: new Date("2019-10-10"),
    distance: 500,
    time: 119
  }
];

type Result = {
  rank: number;
  competitorId: number;
  entries: ContestEntry[];
};

const results: Result[] = [
  {
    rank: 1,
    competitorId: 0,
    entries: []
  }
];

enum Metrics {
  Distance, // m
  Time // s
}

type Contest = {
  name: string;
  metric: Metrics;
  objective: number;
  description?: string;
};

enum IntervalTypes {
  Seconds,
  Minutes,
  Hours,
  Days,
  Weeks,
  Months,
  Years
}

export type Comp = {
  name: string;
  contests: Contest[];
  competitors: Competitor[];
  durationInterval?: IntervalTypes;
  duration?: number;
  interContestInterval?: IntervalTypes;
  interContest?: number;
  entryLimitForDuration?: number;
  entryIntervalType?: IntervalTypes;
  entryLimitPerInterval?: number;
};

const comps: Comp[] = [
  {
    name: "Long Distance",
    contests: [
      {
        name: "Long Distance 1",
        description: "First in the Long distance contest series",
        metric: Metrics.Time,
        objective: 600
      },
      {
        name: "Long Distance 2",
        description: "Second in the Long distance contest series",
        metric: Metrics.Time,
        objective: 720
      },
      {
        name: "Long Distance 3",
        description: "Third in the Long distance contest series",
        metric: Metrics.Time,
        objective: 840
      },
      {
        name: "Long Distance 4",
        description: "Fourth in the Long distance contest series",
        metric: Metrics.Time,
        objective: 960
      },
      {
        name: "Long Distance 5",
        description: "Last in the Long distance contest series",
        metric: Metrics.Time,
        objective: 1080
      }
    ],
    competitors
  }
];

export type CompetitionState = {
  comps: Comp[];
  entries: ContestEntry[];
};
const initialState: CompetitionState = {
  comps,
  entries: contestEntries
};

export default initialState;
