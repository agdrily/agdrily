expect = require('chai').expect

describe 'World Map Page (Phantom)', ->
  this.timeout(10000)

  it 'should load the page', (done) ->
    # and set the size of the canvas
    runPhantom (ph) ->
      ph.createPage (page) ->
        page.open "http://localhost:#{port}/world_map", (status) ->
          expect(status).to.equal 'success'
          page.evaluate (-> { canvasWidth: $('#mainCanvas').width(), windowWidth: window.innerWidth }), (result) ->
            expect(result.canvasWidth).to.equal result.windowWidth
            ph.exit()
            done()
