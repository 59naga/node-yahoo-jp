# Dependencies
yahooJp= require '../src'

# Specs
describe 'yahooJp',->
  describe '.fetchAll',->
    it 'デフォルト１０件',(done)->
      queires=
        p: 'UE4.8.3'

      options= {}

      yahooJp.fetchAll queires,options
      .then (items)->
        expect(items.length).toBe 10
        
        done()

    it '２４時間以内',(done)->
      queires=
        p: 'UE4.8.3'
        vd: 'd'

      options= {}

      yahooJp.fetchAll queires,options
      .then (items)->
        console.log JSON.stringify items,null,2
        expect(items.length).toBe 10
        
        done()

    it '該当なし',(done)->
      queires=
        p: 'ffjdksajflkdsajfdjasfjdafldj'

      options= {}
        
      yahooJp.fetchAll queires,options
      .then (items)->
        expect(items.length).toBe 0
        
        done()

  describe '.fetchAll using options',->
    it '１００件／５リクエスト同時',(done)->
      queires=
        p: 'UE4.8.3'

      options=
        limit: 10
        concurrency: 5

      yahooJp.fetchAll queires,options
      .then (items)->
        expect(items.length).toBe 100
        
        done()
