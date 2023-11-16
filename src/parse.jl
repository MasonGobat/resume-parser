using ZipFile, Printf

function getFile()
    filename = "./test/"

    while (true)
        try
            print("Name of file to be parsed: ")
            filename *= readline()
            
            if stat(filename).size == 0
                throw(ArgumentError(""))
            end

            break
        catch
            @printf "File: %s does not exist\n" filename
        end
    end

    return filename
end

function getContents(filename::String)
    archive = ZipFile.Reader(filename)
    text = ""

    for f in archive.files
        if (occursin("word/document.xml", f.name))
            contents = read(f, String)
            regex = r"<w:t>(.*?)</w:t>"
            matches = eachmatch(regex, contents)

            for str in matches
                text *= " " * str[1]
            end

            return text
        end
    end
end

println(getContents(getFile()))