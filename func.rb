def ls(arqv)
  File.readlines(arqv).map(&:chomp)
end






def nv(arqv, listvalues)
  File.write(arqv, listvalues.join("\n"))
end


