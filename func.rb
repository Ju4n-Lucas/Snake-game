def ls(arqv)
  File.readlines(arqv).map(&:chomp)
end





def nv(arqv, listvalues)
  if listvalues.is_a?(String)
    listvalues = listvalues.split("\n")
  end
  File.write(arqv, listvalues.join("\n"))
end
