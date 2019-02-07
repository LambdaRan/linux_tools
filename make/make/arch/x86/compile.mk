
$(BUILDDIR)/%.o: %.c 
	@$(MKDIR)
	@echo compiling $<
	$(NOECHO)$(CC) $(CFLAGS) $(INCLUDES) -c $< -MMD -MT $@ -MF $(@:%o=%d) -o $@

$(BUILDDIR)/%.o: %.cc
	@$(MKDIR)
	@echo compiling $<
	$(NOECHO)$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -MMD -MT $@ -MF $(@:%o=%d) -o $@

$(BUILDDIR)/%.o: %.cpp
	@$(MKDIR)
	@echo compiling $<
	$(NOECHO)$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -MMD -MT $@ -MF $(@:%o=%d) -o $@
	
$(BUILDDIR)/%.o: %.S 
	@$(MKDIR)
	@echo compiling $<
	$(NOECHO)$(CXX) $(CFLAGS) $(ASMFLAGS) $(INCLUDES) -c $< -MD -MT $@ -MF $(@:%o=%d) -o $@

