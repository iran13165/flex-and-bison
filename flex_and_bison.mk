##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=flex_and_bison
ConfigurationName      :=Debug
WorkspacePath          :="/home/iran/flex and bison"
ProjectPath            :="/home/iran/flex and bison"
IntermediateDirectory  :=$(ConfigurationName)
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=IRAN
Date                   :=20/04/23
CodeLitePath           :=/home/iran/.codelite
LinkerName             :=g++
SharedObjectLinkerName :=g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.o.i
DebugSwitch            :=-gstab
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E 
ObjectsFileList        :="flex_and_bison.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -O0
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch). $(LibraryPathSwitch)Debug 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := ar rcus
CXX      := g++
CC       := gcc
CXXFLAGS :=  -g -Wall $(Preprocessors)
CFLAGS   :=   $(Preprocessors)
ASFLAGS  := 
AS       := as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/hash_table.c$(ObjectSuffix) $(IntermediateDirectory)/test.c$(ObjectSuffix) $(IntermediateDirectory)/lex.yy.c$(ObjectSuffix) $(IntermediateDirectory)/hello.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@test -d $(ConfigurationName) || $(MakeDirCommand) $(ConfigurationName)


$(IntermediateDirectory)/.d:
	@test -d $(ConfigurationName) || $(MakeDirCommand) $(ConfigurationName)

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/hash_table.c$(ObjectSuffix): hash_table.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/hash_table.c$(ObjectSuffix) -MF$(IntermediateDirectory)/hash_table.c$(DependSuffix) -MM hash_table.c
	$(CC) $(SourceSwitch) "/home/iran/flex and bison/hash_table.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/hash_table.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/hash_table.c$(PreprocessSuffix): hash_table.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/hash_table.c$(PreprocessSuffix) hash_table.c

$(IntermediateDirectory)/test.c$(ObjectSuffix): test.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/test.c$(ObjectSuffix) -MF$(IntermediateDirectory)/test.c$(DependSuffix) -MM test.c
	$(CC) $(SourceSwitch) "/home/iran/flex and bison/test.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/test.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/test.c$(PreprocessSuffix): test.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/test.c$(PreprocessSuffix) test.c

$(IntermediateDirectory)/lex.yy.c$(ObjectSuffix): lex.yy.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/lex.yy.c$(ObjectSuffix) -MF$(IntermediateDirectory)/lex.yy.c$(DependSuffix) -MM lex.yy.c
	$(CC) $(SourceSwitch) "/home/iran/flex and bison/lex.yy.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/lex.yy.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/lex.yy.c$(PreprocessSuffix): lex.yy.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/lex.yy.c$(PreprocessSuffix) lex.yy.c

$(IntermediateDirectory)/hello.c$(ObjectSuffix): hello.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/hello.c$(ObjectSuffix) -MF$(IntermediateDirectory)/hello.c$(DependSuffix) -MM hello.c
	$(CC) $(SourceSwitch) "/home/iran/flex and bison/hello.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/hello.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/hello.c$(PreprocessSuffix): hello.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/hello.c$(PreprocessSuffix) hello.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r $(ConfigurationName)/


