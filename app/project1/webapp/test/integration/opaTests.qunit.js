sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/materialList',
		'project1/test/integration/pages/materialObjectPage'
    ],
    function(JourneyRunner, opaJourney, materialList, materialObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThematerialList: materialList,
					onThematerialObjectPage: materialObjectPage
                }
            },
            opaJourney.run
        );
    }
);