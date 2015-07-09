expect = require('chai').expect
phantom = require 'phantom'

describe 'World Map Page (Phantom)', ->
  this.timeout(10000)

  it 'should load the page', (done) ->
    phantom.create (ph) ->
      ph.createPage (page) ->
        page.open "http://localhost:#{port}/world_map", (status) ->
          expect(status).to.equal 'success'
          ph.exit()
          done()
    , { dnodeOpts: { weak: false }}
