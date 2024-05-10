sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'incidentmanagement004/Incidents/test/integration/FirstJourney',
		'incidentmanagement004/Incidents/test/integration/pages/IncidentsList',
		'incidentmanagement004/Incidents/test/integration/pages/IncidentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, IncidentsList, IncidentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('incidentmanagement004/Incidents') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheIncidentsList: IncidentsList,
					onTheIncidentsObjectPage: IncidentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);