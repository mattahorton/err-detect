`import Ember from 'ember'`
`import 'vendor/vexflow/build/vexflow/vexflow-min'`
`import request from 'ic-ajax'`

VexFlowComponent = Ember.Component.extend

  getParameter: (name) ->
    name = name.replace(/\[]/, "\\[").replace(/[\]]/, "\\]")
    regex = new RegExp("[\\?&]" + name + "=([^&#]*)")
    results = regex.exec(window.location.search)
    unless results?
      `undefined`
    else
      decodeURIComponent results[1].replace(/\+/g, " ")

  didInsertElement: ->
    self = this
    
    VexDocument = null
    VexFormatter = null
        
    uri = @getParameter("doc")
    uri = "bach_bwv846p.xml"  unless uri
            
    loadStart = new Date().getTime() # time load
    req = request "assets/samples/" + uri
    
    req.then (data) ->
      return  unless data?
    
      loadElapsed = (new Date().getTime() - loadStart) / 1000
      console.log "Time to load document: " + loadElapsed.toString()  if typeof console isnt "undefined" and typeof console.log is "function"
                
      start = new Date().getTime() # time execution
      
      try
        VexDocument = new Vex.Flow.Document(data)
      catch e
      	Ember.$(".content")[0].innerHTML = "There was an error with the document."
      content = Ember.$(".content")[0]
      console.log VexDocument
            
      if VexDocument
      	VexFormatter = VexDocument.getFormatter()
      	VexFormatter.draw content
                
      elapsed = (new Date().getTime() - start) / 1000
      console.log "Time to display document: " + elapsed.toString()  if typeof console isnt "undefined" and typeof console.log is "function"
      debouncedResize = null
            
      Ember.$(window).resize ->
        unless debouncedResize
          debouncedResize = setTimeout((->
            VexFormatter.draw content
            debouncedResize = null
          ), 500)

`export default VexFlowComponent`
