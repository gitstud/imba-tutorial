var store = {
  squares: ['','','','','','','','','']
  player: 'X'
  winner: ''
}

tag Square
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
      if (store['squares'][a] !== '')
        if (store['squares'][a] === store['squares'][b])
          if (store['squares'][a] === store['squares'][c])
            flag = true
            break
    if flag
      store['winner'] = "{store['player']} is the winner!!! 🎉"
      true
    else
      false
  def updateSquares
    if store['winner'] !== ''
      return
    if store['squares'][value] === ''
      store['squares'][value] = store['player']

      var winner = calculateWinner(store['squares'])
      console.log(winner)
      if winner
        return
      if store['player'] === 'X'
        store['player'] = 'O'
      else
        store['player'] = 'X'

  def render
    <self>
      <button.square :click.updateSquares> "{store['squares'][value]}"

tag Board
  def render
    <self>
      <div.status> "Next player: {store['player']}"
      <div.board-row>
        <Square value="0">
        <Square value="1">
        <Square value="2">
      <div.board-row>
        <Square value="3">
        <Square value="4">
        <Square value="5">
      <div.board-row>
        <Square value="6">
        <Square value="7">
        <Square value="8">

tag App
  def reset
    store['squares'] = ['','','','','','','','','']
    store['player'] = 'X'
    store['winner'] = ''
  def render
    <self>
      <Board>
      if store['winner'] !== ''
        <div> "{store['winner']}"
        <button :click.reset> "RESET GAME"

Imba.mount <App[store]>