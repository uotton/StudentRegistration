package ua.lviv.lgs.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ua.lviv.lgs.domain.Faculty;
import ua.lviv.lgs.domain.Statement;
import ua.lviv.lgs.domain.User;
import ua.lviv.lgs.service.FacultyService;
import ua.lviv.lgs.service.StatementService;
import ua.lviv.lgs.service.UserService;

@Controller
public class StatementController {

	@Autowired
	private UserService userService;

	@Autowired
	private FacultyService facultyService;

	@Autowired
	private StatementService statementService;

	@RequestMapping(value = "/entrantRegistration", method = RequestMethod.GET)
	public ModelAndView showSubjects(@RequestParam("currentFacultyId") Integer currentFacultyId,
			@RequestParam("currentUserEmail") String currentUserEmail) {
		Faculty faculty = facultyService.findFacultyById(currentFacultyId);
		User user = userService.findUserByEmail(currentUserEmail);

		Statement statement = new Statement();
		statement.setFaculty(faculty);
		statement.setUser(user);

		ModelAndView modelAndView = new ModelAndView("entrantRegistration");
		modelAndView.addObject("statement", statement);
		return modelAndView;
	}

	@RequestMapping(value = "/addMarks", method = RequestMethod.POST)
	public ModelAndView registration(@Valid @ModelAttribute("statement") Statement statement,
			BindingResult bindingResult) {
		Faculty faculty = facultyService.findFacultyById(statement.getFacultyId());
		User user = userService.findUserByEmail(statement.getUserEmail());

		statement.setUser(user);
		statement.setFaculty(faculty);
		statementService.save(statement);

		return new ModelAndView("redirect:/home");
	}

	@RequestMapping(value = "/rating", method = RequestMethod.GET)
	public ModelAndView showRating() {
		ModelAndView modelAndView = new ModelAndView("rating");
		modelAndView.addObject("statements", statementService.findAllStatements());
		return modelAndView;
	}
}