using ZipFile, Printf

filename = ""

while (true)
    try
        print("Name of file to be parsed: ")
        global filename = "./test/" * readline()
        archive = open(filename, "r")
        break
    catch
        @printf "File: %s does not exist\n" filename
    end
end

archive = ZipFile.Reader(filename)

for f in archive.files
    if (occursin("word/document.xml", f.name))
        contents = read(f, String)
        regex = r"<w:t>.*?</w:t>"
        matches = eachmatch(regex, contents)

        for str in matches
            println(str)
        end
    end
end