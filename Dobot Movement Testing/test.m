% robot = DobotMagician;
% q = [0,pi/2,0,0,0];
% % robot.model.plot(q);
% % camlight
% hold on;
% % plot_h = plot3(0,0,0,'.r');
% for joint2Rads = pi/2 : -0.1:0
%     q = [0,joint2Rads,0,pi/2,0];
%     % UPDATE: fkine function now returns an SE3 object.
%     % To obtain the Transform Matrix, access the
%     % variable in the object 'T' with '.T'.
%     % tr = robot.model.fkine(q).T;
%     disp(robot.model.fkine(q).T);
%     % transformedPoints = [tr * [pointMeters,ones(size(pointMeters,1),1)]']';
%     % transformedPoints = transformedPoints(:,1:3);
%     % plot_h.XData = transformedPoints(:,1);
%     % plot_h.YData = transformedPoints(:,2);
%     % plot_h.ZData = transformedPoints(:,3);
%     robot.model.animate(q);
%     % axis equal
%     drawnow();
%     pause(0.5);
% end
%%
% end

robot = DobotMagician();

% Define a list of joint configurations (poses) to move to
poses = [
    0, pi/4, pi/4, pi/2, 0; % start pose
    0, pi/6, pi/4, pi/2, 0;

    pi/4, pi/4, pi/4, pi/2, 0;
    pi/4, pi/6, pi/4, pi/2, 0;

    pi/6, pi/4, pi/4, pi/2, 0;
    pi/6, pi/6, pi/4, pi/2, 0;

    pi/8, pi/4, pi/4, pi/2, 0;
    pi/8, pi/6, pi/4, pi/2, 0;

    -pi/4, pi/4, pi/4, pi/2, 0;
    -pi/4, pi/6, pi/4, pi/2, 0;

    -pi/6, pi/4, pi/4, pi/2, 0;
    -pi/6, pi/6, pi/4, pi/2, 0;

    -pi/8, pi/4, pi/4, pi/2, 0;
    -pi/8, pi/6, pi/4, pi/2, 0;
];

% Loop through each pose
for i = 1:size(poses, 1)
    % Get the current pose
    currentPose = poses(i, :);

    % Move the robot to the current pose
    robot.model.animate(currentPose);

    % Pause to observe the transformation
    pause(2); % You can adjust the pause duration as needed

    % Display the transformation matrix of the end effector
    disp(['Transformation Matrix for Pose ', num2str(i), ':']);
    disp(robot.model.fkine(currentPose).T);
end

% robot = DobotMagician;
% 
% targetJointPoses = [
%     0, pi/4, 0, 0, 0; % start pose
% 
%     0, pi/4, 0, 0, 0;
%     0, pi/4, pi/4, pi/4, 0;
% 
%     pi/4, pi/4, 0, 0, 0;
%     pi/4, pi/4, pi/4, 0, 0;
% 
%     pi/6, pi/4, pi/4, 0, 0;
%     pi/6, pi/4, 0, 0, 0;
% 
%     pi/8, pi/4, pi/4, 0, 0;
%     pi/8, pi/4, 0, 0, 0;
% 
%     -pi/4, pi/4, 0, 0, 0;
%     -pi/4, pi/4, pi/4, 0, 0;
% 
%     -pi/6, pi/4, pi/4, 0, 0;
%     -pi/6, pi/4, 0, 0, 0;
% 
%     -pi/8, pi/4, 0, 0, 0;
%     -pi/8, pi/4, pi/4, 0, 0;
% ];
% 
% % Initialize the trajectory with the first pose
% trajectory = targetJointPoses(1, :);
% 
% numSteps = 50;
% 
% % Initialize an empty cell array to store the trajectory
% fullTrajectory = cell(1, 0);
% 
% % Generate trajectory for each pair of consecutive poses
% for i = 1:size(targetJointPoses, 1) - 1
%     startPose = targetJointPoses(i, :);
%     endPose = targetJointPoses(i + 1, :);
% 
%     % Interpolate poses to create a smooth trajectory segment
%     segmentTrajectory = interpolatePoses(startPose, endPose, numSteps);
% 
%     % % Concatenate the segment trajectory to the full trajectory
%     % fullTrajectory = [fullTrajectory, segmentTrajectory];
% 
%     % Move the robot along the complete trajectory
%     moveDobot(robot, segmentTrajectory, numSteps);
% 
%     disp(['Transformation Matrix for Pose ', num2str(i), ':']);
%     disp(robot.model.fkine(endPose).T);
% 
%     startPose = targetJointPoses(i+1);
% 
%     pause(2);
% end
% 
% disp(['DONE']);
% 
% function moveDobot(robot, trajectory, numSteps)
%     % Move the Dobot Magician robot along a given trajectory
%     for i = 1:numSteps
%         % Calculate the end-effector transformation using forward kinematics
%         endEffectorPose = robot.model.fkine(trajectory{i});
% 
%         % Solve joint angles using inverse kinematics
%         qSol = robot.model.ikine(endEffectorPose, 'q0', zeros(1, 5), 'mask', [1 1 1 1 1 0]);
% 
%         robot.model.animate(qSol); % Animate the robot's motion
%         drawnow;
%     end
% end
% 
% function trajectory = interpolatePoses(startPose, endPose, numSteps)
%     % Interpolate between two joint configurations to generate a trajectory
%     trajectory = cell(1, numSteps);
%     for i = 1:numSteps
%         t = (i - 1) / (numSteps - 1);
%         % Linear interpolation between start and end joint configurations
%         interpolatedPose = (1 - t) * startPose + t * endPose;
%         trajectory{i} = interpolatedPose;
%     end
% end

% % Create a UR3 robot model
% ur3 = DobotMagician();
% 
% drawnow;
% 
% disp('Press ENTER to Start');
% 
% % Initialize the initial pose
% initial_pose = transl(0.2533, 0.1462, 0.2947) * rpy2tr(180, 0, 0, 'deg'); %key_poses{1};
% 
% num_steps = 10;
% 
% key_poses1 = {
% transl(0.2533, 0.1462, 0.2947) * rpy2tr(180, 0, 0, 'deg'); 
% transl(0.1, -0.4, 0.9) * rpy2tr(180, -90, 0, 'deg');  
% transl(0.5, -0.4, 0.9) * rpy2tr(180, -90, -90, 'deg'); 
% transl(0.5, -0.4, 0.9) * rpy2tr(180, 0, -180, 'deg'); 
% };
% 
% for i = 1:(length(key_poses1) - 1)
%     trajectory = interpolatePoses(initial_pose, key_poses1{i+1}, num_steps);
%     moveUR3(ur3, trajectory, num_steps);
%     initial_pose = key_poses1{i+1}; % Update the initial pose for the next step
% end
% 
% 
% %% moveUR3 Function (with Gripper attached)
% function moveUR3(robot, trajectory, numSteps)
%     % Move the UR3 robot along a given trajectory
%     for i = 1:numSteps
%         % Solve joint angles using inverse kinematics
%         qSol = robot.model.ikine(trajectory{i}, 'q0', zeros(1, 5), 'mask', [1 1 1 1 1 0]);
% 
%         robot.model.animate(qSol); % Animate the robot's motion
%         drawnow;
%     end
% end
% 
% %% Trajectory Function - Stores intermediate poses and returns as the result
% function trajectory = interpolatePoses(startPose, endPose, numSteps)
%     % Interpolate between two poses to generate a trajectory
%     trajectory = cell(1, numSteps);
%     for i = 1:numSteps
%         t = (i - 1) / (numSteps - 1);
%         % Linear interpolation between start and end poses
%         interpolatedPose = (1 - t) * startPose + t * endPose;
%         trajectory{i} = interpolatedPose;
%     end
% end
