matrix = require 'matrix'
function love.load()
    love.window.setTitle('Matrix Modifier') 
    --setting defaults
    scale = 10
    mod = 1
    --for fixing quadrant problems
    fix = {{1,0},
           {0,-1}}
    --default as identity matrix
    t = {{1,0},
         {0,1}}
    --the starting square
    a = {{0,1,1,0},
         {0,0,1,1}} 
    --shifts everything properly over for graphing so that negative points are visible
    addX = {{400,400,400,400},
            {300,300,300,300}}
    
end

function love.update(dt)
    if love.keyboard.isDown(' ') then --hold down space for subtraction
        mod = -1 
    else 
        mod = 1
    end  
    --the transformed shape
    b = matrix.mul(t,a) 
end

function love.keypressed(key, True)
    if key == 'q' then 
        t[1][1]=t[1][1]+mod 
    end 
    if key == 'w' then 
        t[1][2]=t[1][2]+mod
    end 
    if key == 'a' then 
        t[2][1]=t[2][1]+mod
    end 
    if key == 's' then 
        t[2][2]=t[2][2]+mod
    end 
    if key == 'up' then 
        a = matrix.add(a,matrix{{0,0,0,0},{1,1,1,1}})
    end 
    if key == 'down' then 
        a = matrix.add(a,matrix{{0,0,0,0},{-1,-1,-1,-1}})
    end 
    if key == 'left' then 
        a = matrix.add(a,matrix{{-1,-1,-1,-1},{0,0,0,0}})
    end 
    if key == 'right' then 
        a = matrix.add(a,matrix{{1,1,1,1},{0,0,0,0}})
    end
    if key == 'escape' then 
        love.load()
    end
end 

function getrect(mat)
    mat = matrix.mul(fix,mat)--adds fix
    mat = matrix.mulnum(mat, scale)--scales up
    mat = matrix.add(mat,addX)--shifts over
    return mat[1][1],mat[2][1],mat[1][2],mat[2][2],mat[1][3],mat[2][3],mat[1][4],mat[2][4]--return points in proper order
end

function love.draw()
    love.graphics.setColor(255,255,255)--white
    --[[
    --draw grid 
        for i = 0, 800, 10 do 
        love.graphics.line(i,0,i,600)
    end 
    for i = 0,800, 10 do 
        love.graphics.line(0,i,800,i)
    end  
    ]]
    --print [T]
    love.graphics.setColor(0,0,255)--blue
    love.graphics.print(t[1][1]..' '..t[1][2],10,10)
    love.graphics.print(t[2][1]..' '..t[2][2],10,20)
    --draw x and y axis
    love.graphics.setColor(255,255,255)
    love.graphics.line(400,0,400,600)
    love.graphics.line(0,300,800,300)
    --draw original
    love.graphics.setColor(255,0,0)--red
    love.graphics.polygon('fill',getrect(a))
    --draw transformed
    love.graphics.setColor(0,255,0)--green
    love.graphics.polygon('fill',getrect(b))   
end
