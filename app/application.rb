class Application 

    @@items = [Item.new("Figs", 3.42), Item.new("Pears", 0.99)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
    

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last

            if item = @@items.find {|item| item.name == item_name} 
                resp.write item.price
            else 
                resp.status = 400               
                resp.write "Item not found"
            end 

        else 
            resp.write "Route not found"
            resp.status = 404
        end 
        resp.finish

    end 
end 



  
        # if req.path != "/items/"

        #   else
        #     req.path.match(/items/)

        #     #if
        #   end 
        # end 

  

# Shopping Cart Rack App
#   Returns 404 for a bad route (FAILED - 1)
#   /items
#     Returns item price if it is in @@item (FAILED - 2)
#     Returns an error and 400 if the item is not there (FAILED - 3)