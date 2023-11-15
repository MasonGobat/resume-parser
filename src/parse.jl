using ZipFile, Printf

filename = ""

while (true)
    try
        print("Name of file to be parsed: ")
        global filename = "./test/" *  readline()
        archive = open(filename, "r")
        break
    catch
        @printf "File: %s does not exist\n" filename
    end
end

files = ZipFile.Reader(filename)
println(files)