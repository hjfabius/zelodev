// communication.h
#include "definition.h"
	
#ifndef COMMUNICATION_H
	#define COMMUNICATION_H

	using namespace std;

	class Communication   {
	protected:
	
		void   openConnection();
		void   sendMessage(char * a_strMessage);
		void   receiveMessage(char * a_strMessage);


	public:
		void	init();
		void	syncronize(MarksManager * _objMarksManager);
		char	* getLocalIP();
		void   closeConnection();
	};

#endif
