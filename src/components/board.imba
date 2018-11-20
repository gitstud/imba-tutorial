import { store } from '../store/data'
import { Square } from './square'

export tag Board
  def render
    <self>
      <div.status> "Next player: {store:player}"
      for b in [0,3,6]
        <div.board-row> for s in [0, 1, 2]
          <Square value="{b + s}">
