import React from 'react'
import { format as formatDate } from 'date-fns'
import { Box, Text } from '../ui'
import { Comp, ContestEntry } from '../reducer/initialState'
import { RouteComponentProps } from '@reach/router'

type CompetitionListProps = {
  comps: Comp[]
  entries: ContestEntry[]
}
const CompetitionList: React.FC<RouteComponentProps<CompetitionListProps>> = ({
  comps = [],
  entries = [],
}) => {
  return (
    <Box>
      <Text>Competitions</Text>
      {comps.map((comp, compId) => (
        <Box key={compId}>
          <Text>{comp.name}</Text>
          {comp.competitors.map((competitor, competitorId) => (
            <Box key={`${compId}${competitorId}`}>
              <Text>{competitor.firstName}</Text>
              <Box>
                {entries
                  .filter(entry => entry.competitorId === competitor.id)
                  .map((entry, entryId) => (
                    <Box key={`${compId}${competitorId}${entryId}`}>
                      <Text>{formatDate(entry.date, 'PPPP')}</Text>
                      <Text>{entry.distance}m</Text>
                      <Text>
                        {Math.floor(entry.time / 60)}:
                        {entry.time % 60 >= 10
                          ? entry.time % 60
                          : `0${entry.time % 60}`}
                      </Text>
                    </Box>
                  ))}
              </Box>
            </Box>
          ))}
        </Box>
      ))}
    </Box>
  )
}

export default CompetitionList
