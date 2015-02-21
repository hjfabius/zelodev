// MarksManager.h
#include "definition.h"
	
#ifndef MARKSMANAGER_H
	#define MARKSMANAGER_H

	using namespace std;

	class MarksManager   {
	private:
		int			m_intNumMarks;
		bool		m_blnInitialized;
		
		int			getMarkIndexByNumber(int a_intMarkNumber);

	public:
		Marks		m_arobjMarks[MAX_NUM_MARKS];

		MarksManager();

		void		init();
		bool		requireToBeSent();
		int			getNumMarks();
		void		setParameters(char * a_strMessage);
		void		getCurrentPositions(char * a_strMessage, char a_intMultiplex);
		void		parametersSent();
	};

#endif
