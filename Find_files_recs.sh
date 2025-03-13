# psudo code.

    # need to be able to do the same things from the other "find_large_files" assignment
    # needs to list the files (ls-l)
    # list the files above 500kbs in size

        # this should be in a function so you can just call it when you want (easy for other directorys)
        #function find_size{
        #
        #    size="500"
        #       (this is just the standard size of the file. it is standard in kb but can be changed with ls parms)
        #
        #    if $file_size -gt $size {
        #       echo $File_name
        #    }
        #}
        #find_size

    # when finding other directorys look for the "d" in the read write exe parms 
            # also you can use awk to find the letters (in this case "d") in the directory listing 

        # then get the name of the directory and in a variable call that with cd
                # so (cd $directory_name) then you go into that directory and list the files above 500kb

        #        cd $directory_name
        #        #find_size()

        #       # make that listing the files a function 
        #            function List_Files{
        #                pwd
        #                ls -l
        #            }

        # you also have to "crawl back out of the file directory -
        # and go back to the other directory (out of the sub directory) with "cd .."

        # print the output of the file and its size (FILE: $File_name "and the file size is:" $File_size)
        # dont use ls -a it makes things weird 


# Start code
#!/bin/bash                                                                                IMPORTANT THINGS TO NOTE
                                    #PLEASE NOTE FOR THE FILE CHECKER ON LINE 62 STAT -f%z IS ONLY FOR MAC TO MAKE IT WORK FOR LINUX CHANGE "f" TO "c" AND CHANGE "z" TO "s"
                                                            #PLEASE NOTE: IF YOU RUN THIS ON YOUR MAIN DIR IT WILL GO THROUGH EVERYTHING!!!
                                                                    #THIS WILL TAKE TIME (depending on how many files you have)
function File_check()
{
    maxSize=500000

    # Start File check
    local file=$1                                                                  # Makes the $1 local to this function
    if [ -f "$file" ]; then                                                        # Checks if file is a file
        local filesize                                                             # Makes filesize local to this function
        filesize=$(stat -f%z "$file" )                                                      # this checks a file size 
        if [[ "$filesize" =~ ^[0-9]+$ ]] && [ "$filesize" -gt "$maxSize" ]; then                    # checks to see if filesize is a number from 0-9 and if filesize is greater than (-gt) max size
            echo "The file: $file is greater than 500kb. The Size is: $filesize Bytes"              # Prints the name of the file and the size of the file
        fi
    fi
}

function List_The_Files()                                                          # The Main Function for the whole thing!
{
    echo "-----------------------------------------------------------------------"
    echo "Current Directory: $(pwd)  "                                             # Gives the Working directory of the curent DIR

    for file in *; do                                                              # Another for loop for everything in * meaning it matches any sequence of chars (looks for files)
        File_check "$file"                                                         # Calling the other function
    done

    for dir in */; do                                                              # This is the MAIN check for DIRs and sub DIRs 
                                                                                   # The "*" matches any sequence of chars (execpt the ones starting with a dot)
                                                                                   # and the "/" makes sure the match is a DIR (because they end with a /)
        [ -d "$dir" ] || continue                                                  # This checks to see if its an actual directory
        cd "$dir" 2>/dev/null || continue                                               # This makes it so any "errors" dont show up (if there are any errors)
        echo "-----------------------------------------------------------------------"  # This is just for formatting (figured it would be better to think of when making this at the start then not)
        echo "Inside directory: $dir"                                                   # Prints the Directory name while inside the DIR
        echo "-----------------------------------------------------------------------"
        List_The_Files                                                                  # For recursion (it calls the function again so it can do the sub DIRs)
        cd ..                                                                      # If it iderates through all of the DIRs then it goes back untill it finds another one 
    done
}
List_The_Files                                                                     # The orignal call of the function




# side note: it always suprizes me how much the code will shrink by from planning to now