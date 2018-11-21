import { store } from '../store/data'

export tag Square
  prop value
  def calculateWinner squares
    var lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ]
    var flag = false
    for line in lines
      var a = line[0]
      var b = line[1]
      var c = line[2]
      if (squares[a] !== '')
        if (squares[a] === squares[b])
          if (squares[a] === squares[c])
            flag = true
            break
    if flag
      store:winner = "{store:player} is the winner!!! 🎉"
      true
    else
      var catsGame = squares.filter do |v| !v
      if !catsGame.len
        store:winner = 'No Winner'
        true
      false
  def updateSquares
    if store:winner !== ''
      return
    if store:squares[value] === ''
      store:squares[value] = store:player

      var winner = calculateWinner(store:squares)
      console.log(winner)
      if winner
        return
      if store:player === 'X'
        store:player = 'O'
      else
        store:player = 'X'

  def render
    <self>
      <button.square :click.updateSquares> "{store:squares[value]}"
