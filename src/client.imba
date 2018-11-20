import { store } from './store/data'
import { Board } from './components/board'

tag App
  def reset
    store:squares = ['','','','','','','','','']
    store:player = 'X'
    store:winner = ''
  def render
    <self>
      <Board>
      if store:winner !== ''
        <div> "{store:winner}"
        <button :click.reset> "RESET GAME"

Imba.mount <App[store]>
